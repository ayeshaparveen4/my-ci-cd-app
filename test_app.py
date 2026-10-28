from pathlib import Path


def test_homepage_message():
    code = Path("app.py").read_text()

    assert "Hello! My CI/CD pipeline works." in code