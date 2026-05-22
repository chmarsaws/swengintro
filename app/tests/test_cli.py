from teampulse.cli import main


def test_main_prints_dashboard(capsys):
    code = main([])
    assert code == 0
    out = capsys.readouterr().out
    assert "TeamPulse Dashboard" in out
    assert "Alex Chen" in out
