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
package org.eclipse.lsp.cobol.common.model;

import javax.annotation.Nullable;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Objects;

/** Uri container to enforce type checks*/
public class Uri {
    public static final Uri EMPTY = new Uri("");
    // URI should be always encoded.
    private final String uri;

    public Uri(String uri) {
        this.uri = uri;
    }

    public static Uri fromLsp(String uri) {
        return new Uri(uri);
    }

    public String decode() {
        try {
            return URLDecoder.decode(uri, StandardCharsets.UTF_8.toString());
        } catch (UnsupportedEncodingException e) {
            throw new IllegalArgumentException("Charset is unsupported", e);
        }
    }
    public String toLsp() {
        return uri;
    }
    /**
     * Normalize the URI defined in the workspace to get a NIO Path object that will be used within
     * the FileSystemService, example: [input:
     * file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy] --} [output:
     * C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy]
     *
     * @return the {@link Path} representation of the given URI in input
     * @throws IllegalArgumentException if the URI of WorkspaceFolder is not valid
     */
    public Path getPath() {
        try {
            // FIXME: that doesnt look like proper decoding of URI
            String decodedUri = uri.replace(" ", "%20");
            Path path = Paths.get(new URI(decodedUri).normalize());
            if (path.startsWith("\\") || path.startsWith("/")) {
                path = Paths.get(new URI(decodedUri).getPath());
            }
            return path;
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException("Cannot find file by given URI: " + uri, e);
        }
    }

    @Override
    public String toString() {
        return decode();
    }
    /**
     * Extract the name and extension of a file from a valid {@link URI} and return the name back to
     * the client as String or an empty string.
     *
     * @return the String representation of the file name and extension or an empty string
     */
    @Nullable
    public String getName() {
        return new File(decode()).getName().replaceFirst("\\?.*$", "");
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Uri uri = (Uri) o;
        return Objects.equals(this.uri, uri.uri);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(uri);
    }

}
