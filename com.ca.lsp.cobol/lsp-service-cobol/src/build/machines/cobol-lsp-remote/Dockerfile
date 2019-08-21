# Copyright (c) 2019 Broadcom.
# The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Broadcom, Inc. - initial API and implementation
# Base Alpine Linux based image with OpenJDK JRE only
FROM openjdk:8-jre-alpine
MAINTAINER Giuseppe La Mantia (giuseppe.lamantia@ca.com)
EXPOSE 1044
ARG LSPJARPATH
ARG JARFILENAME
ENV JARFILENAME=${JARFILENAME}
# get artifact
#RUN wget http://czprapd-jenkins:8081/artifactory/libs-release-local/com/ca/lsp/lsp-service-cobol/1.0.1/lsp-service-cobol-1.0.1-jar-with-dependencies.jar -O /tmp_LSPCobolServer/lsp-service-cobol-jar-with-dependencies.jar
ADD ./ /tmp_LSPCobolServer/
# specify default command
CMD java -jar /tmp_LSPCobolServer/$JARFILENAME
