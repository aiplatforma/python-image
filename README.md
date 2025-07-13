# Python image for AI Platform

Image contents:

- Curl
- Git
- Build essentail package group (C compiler and build tools)
- jq
- asdf version manager
- uv
- python3 (and python to python3 alias, system version)
- jupyterlab (pypi)

## Notes

### Python version management

Custom Python versions are not being installed by default. They should only be installed in special scenarios when the distribution Python version cannot be used.

Currently there is no preference between asdf and uv Python version management. We still need to gather more usage data to determine a prefered way to manage versions.

### PyPi system packages

Python packages with are used at the system level should be installed from PyPi with the `--break-system-packages` option. No Python package should be installed through the distribution package management tool.

Python libraries used by users should be installed in a virtual environment, preferably managed through uv.

## Maintainers

- Dušan Simić
