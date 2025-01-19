import pytest
from pypi_examiner import examiner


def test_user_exists():
    pypi = examiner()
    result = pypi.maintained_by("tweedge")

    assert "unishox2-py3" in result and "pypi-examiner" in result


def test_user_does_not_exist():
    pypi = examiner()
    result = pypi.maintained_by("^")

    assert result == []