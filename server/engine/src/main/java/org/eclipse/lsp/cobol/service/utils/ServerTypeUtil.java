/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service.utils;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;

/**
 * Utility class for registered server type
 */
@UtilityClass
public class ServerTypeUtil {
    /**
     * Checks if the registered serverType is compatible with the registered dialects.
     * True, if server type is NATIVE and dialects are registered, false otherwise.
     *
     * @param analysisConfig Configuration
     * @return True, if server type is NATIVE and dialects are registered, false otherwise.
     */
    public boolean isInCompatibleServerTypeRegistered(@NonNull AnalysisConfig analysisConfig) {
        return isNativeServerType() && !analysisConfig.getDialects().isEmpty();
    }

    /**
     * True if server is started as a native server.
     *
     * @return True if server is started as a native server
     */
    public boolean isNativeServerType() {
        return System.getProperty("serverType", "JAVA").equalsIgnoreCase("NATIVE");
    }
}
