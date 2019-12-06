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

import os
import sys
import urllib.request as urllib2
import urllib.parse as urlparse
import zipfile
import tarfile

ENGINES_EXE = {
    "chrome": "chromedriver",
    "firefox": "geckodriver"
}

DRIVERS = {
    "darwin": {
        "firefox": "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-macos.tar.gz",
        "chrome": "https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_mac64.zip"
    },
    "linux": {
        "firefox": "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz",
        "chrome": "https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_linux64.zip"
    },
    "win32": {
        "firefox": "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-win64.zip",
        "chrome": "https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_win32.zip"
    }
}


def unzip_file(file_path, save_dir=None):
    if save_dir is None:
        save_dir = "."

    with zipfile.ZipFile(file_path, 'r') as zip_file:
        names = zip_file.namelist()
        zip_file.extractall(save_dir)

    return names


def untar_file(file_path, save_dir=None):
    if save_dir is None:
        save_dir = "."

    with tarfile.open(file_path) as tar:
        names = tar.getnames()
        tar.extractall(save_dir)

    return names


def download_file(url, save_dir=None):
    """
    Download and save a file specified by url to save_dir directory,
    """
    u = urllib2.urlopen(url)

    scheme, netloc, path, query, fragment = urlparse.urlsplit(url)
    filename = os.path.basename(path)
    if not filename:
        filename = 'downloaded.file'

    if save_dir:
        filename = os.path.join(save_dir, filename)

    filename = os.path.abspath(filename)

    with open(filename, 'wb') as f:
        meta = u.info()
        meta_func = meta.getheaders if hasattr(meta, 'getheaders') else meta.get_all
        meta_length = meta_func("Content-Length")
        file_size = None
        if meta_length:
            file_size = int(meta_length[0])

        print("Downloading: {0} Bytes: {1}".format(url, file_size))

        file_size_dl = 0
        block_sz = 8192
        while True:
            buffer = u.read(block_sz)
            if not buffer:
                break

            file_size_dl += len(buffer)
            f.write(buffer)

            status = "{0:16}".format(file_size_dl)
            if file_size:
                status += "   [{0:6.2f}%]".format(file_size_dl * 100 / file_size)

            status += chr(13)
            print(status, end="")

        print()

    return filename


def get_file(url, save_dir):
    file_name = os.path.basename(url)
    save_path = os.path.abspath(os.path.join(save_dir, file_name))
    urllib2.urlretrieve(url, save_path)
    return save_path


def get_archive_type(file_path):
    extension = os.path.splitext(file_path)[1]
    return extension


def extract_archive(file_path, save_dir=None):
    archive_type = get_archive_type(file_path)
    if archive_type == ".zip":
        names = unzip_file(file_path, save_dir)

    elif archive_type in [".tar", ".gz"]:
        names = untar_file(file_path, save_dir)

    else:
        raise Exception("Unsupported archive type: '{0}'".format(archive_type))

    return names


def is_file_executable(file_path):
    if sys.platform in ["windows", "win32"]:
        return True

    return os.access(file_path, os.X_OK)


if __name__ == "__main__":
    # Test/debug only
    firefox_win = DRIVERS["win32"]["firefox"]
    firefox_linux = DRIVERS["linux"]["firefox"]

    gecko_win32 = get_file(firefox_win, ".")
    print("1: {0} downloaded".format(gecko_win32))
    arc_type = get_archive_type(gecko_win32)
    print("File is of {0} archive".format(arc_type))
    names = extract_archive(gecko_win32)
    print("Archive members:\n{0}".format(names))

    gecko_linux = download_file(firefox_linux, save_dir=".")
    print("2: {0} downloaded".format(gecko_linux))
    arc_type = get_archive_type(gecko_linux)
    print("File is of {0} archive".format(arc_type))
    names = extract_archive(gecko_linux)
    print("Archive members:\n{0}".format(names))
