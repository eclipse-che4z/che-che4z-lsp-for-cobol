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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import java.util.List;
import java.util.stream.Collectors;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.Location;

/**
 * Class with utility methods for {@link org.eclipse.lsp.cobol.lsp.LspEvent} handlers
 */
@UtilityClass
public class HandlerUtility {
    /**
     * Maps the provided location to the original location which triggered the request.
     * @param decodedLocations locations with decoded uri's
     * @param service {@link UriDecodeService}
     * @return mapped locations
     */
    List<Location> mapToOriginalLocation(List<Location> decodedLocations, UriDecodeService service) {
        return decodedLocations.stream().map(loc -> {
            loc.setUri(service.getOriginalUri(loc.getUri()));
            return loc;
        }).collect(Collectors.toList());
    }
}
