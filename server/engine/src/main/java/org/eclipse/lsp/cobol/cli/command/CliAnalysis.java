/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.cli.command;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.inject.Guice;
import com.google.inject.Injector;
import java.io.File;
import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryPoolMXBean;
import java.lang.management.MemoryType;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.cli.di.CliModule;
import org.eclipse.lsp.cobol.cli.modules.CliClientProvider;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import picocli.CommandLine;

/**
 * Analysis cli command
 */
@CommandLine.Command(name = "analysis", description = "analyse cobol source")
public class CliAnalysis implements Callable<Integer> {
    @CommandLine.ParentCommand
    private Cli parent;

    @CommandLine.Option(
            names = {"-s", "--source"},
            required = true,
            description = "The COBOL program file.")
    private File src;

    @CommandLine.ArgGroup(multiplicity = "1")
    private Args args;

    @CommandLine.Option(
            description = "Supported dialect values: ${COMPLETION-CANDIDATES}",
            names = {"-d", "--dialect"},
            defaultValue = "COBOL")
    private CobolLanguageId dialect;

    @Override
    public Integer call() throws Exception {
        if (args.workspaceConfig != null)
            parent.initProcessorGroupsReader(args.workspaceConfig.workspace);

        Injector diCtx = Guice.createInjector(new CliModule());
        CliClientProvider cliClientProvider = diCtx.getInstance(CliClientProvider.class);

        cliClientProvider.setCpyPaths(createCopybooksPaths());
        cliClientProvider.setCpyExt(createCopybooksExtensions());
        JsonObject result = new JsonObject();
        result.addProperty("uri", src.toURI().toString());
        result.addProperty("language", dialect.getId());
        try {
            Cli.Result analysisResult = parent.runAnalysis(src, dialect, diCtx, true);
            parent.addTiming(result, analysisResult.ctx.getBenchmarkSession());
            JsonArray diagnostics = new JsonArray();
            analysisResult
                    .ctx
                    .getAccumulatedErrors()
                    .forEach(
                            err -> {
                                JsonObject diagnostic = CliUtils.diagnosticToJson(err);
                                diagnostics.add(diagnostic);
                            });
            result.add("diagnostics", diagnostics);
            result.addProperty("lines", String.valueOf(analysisResult.ctx.getExtendedDocument().toString().split("\n").length));
            result.addProperty("size", String.valueOf(analysisResult.ctx.getExtendedDocument().toString().length()));
            collectGcAndMemoryStats(result);
            System.out.println(CliUtils.GSON.toJson(result));
            return 0;
        } catch (Exception e) {
            result.addProperty("crash", e.getMessage() != null && e.getMessage().isEmpty() ? "error" : e.getMessage());
            System.out.println(CliUtils.GSON.toJson(result));
            return 1;
        }
    }

    private void collectGcAndMemoryStats(JsonObject result) {
        long totalGarbageCollections = 0;
        long garbageCollectionTime = 0;

        for (GarbageCollectorMXBean gc : ManagementFactory.getGarbageCollectorMXBeans()) {
            long count = gc.getCollectionCount();
            if (count >= 0) {
                totalGarbageCollections += count;
            }
            long time = gc.getCollectionTime();
            if (time >= 0) {
                garbageCollectionTime += time;
            }
        }
        result.addProperty("gc.count", totalGarbageCollections);
        // milliseconds to seconds
        result.addProperty("gc.time", garbageCollectionTime * 0.001);

        List<MemoryPoolMXBean> pools = ManagementFactory.getMemoryPoolMXBeans();
        long total = 0;
        for (MemoryPoolMXBean memoryPoolMXBean : pools) {
            if (memoryPoolMXBean.getType() == MemoryType.HEAP) {
                long peakUsed = memoryPoolMXBean.getPeakUsage().getUsed();
                total = total + peakUsed;
            }
        }
        result.addProperty("memory.heap_peak", total / 1024 / 1024);
    }

    /**
     * WorkspaceConfig options
     */
    static class WorkspaceConfig {
        @CommandLine.Option(
                description = "Path to workspace folder.",
                names = {"-ws", "--workspace"})
        private Path workspace;
    }

    /**
     * explicit config options
     */
    static class ExplicitConfig {
        @CommandLine.Option(
                names = {"-cf", "--copybook-folder"},
                description = "Path to the copybook folder.")
        private File[] cpyPaths = {};

        @CommandLine.Option(
                names = {"-ce", "--copybook-extension"},
                description = "List of copybook paths.")
        private String[] cpyExt = {"", ".cpy"};
    }

    /**
     * options for analysis command
     */
    static class Args {
        @CommandLine.ArgGroup(exclusive = false)
        ExplicitConfig explicitConfig;

        @CommandLine.ArgGroup(exclusive = false)
        WorkspaceConfig workspaceConfig;
    }

    private List<File> createCopybooksPaths() {
        if (args.workspaceConfig != null && parent.processorGroupsResolver != null) {
            return parent
                    .processorGroupsResolver
                    .resolveCopybooksPaths(src.toPath(), args.workspaceConfig.workspace)
                    .stream()
                    .map(Path::toFile)
                    .collect(Collectors.toList());
        }
        return Arrays.asList(args.explicitConfig.cpyPaths);
    }

    private List<String> createCopybooksExtensions() {
        if (args.workspaceConfig != null && parent.processorGroupsResolver != null) {
            return parent.processorGroupsResolver.resolveCopybooksExtensions(
                    src.toPath(), args.workspaceConfig.workspace);
        }
        return Arrays.asList(args.explicitConfig.cpyExt);
    }
}
