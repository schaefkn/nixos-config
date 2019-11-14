{ buildGoPackage, fetchFromGitHub, stdenv, libpulseaudio, notmuch }: buildGoPackage rec {
  name = "statusbar-${version}";
  version = "1";

  src = fetchFromGitHub {
    owner = "dasJ";
    repo = "statusbar";
    rev = "master";
    sha256 = "1qdjl767b7bklyxs5q3zr6fbpq0pg3lg435h1bmnrhy49cm81zci";
  };

  goPackagePath = "github.com/dasJ/statusbar";

  buildInputs = [ libpulseaudio notmuch ];

  meta = with stdenv.lib; {
    description = "My personal status bar";
  };
}
