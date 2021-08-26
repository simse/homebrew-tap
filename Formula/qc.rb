class Qc < Formula
  desc "Tool for converting between file formats"
  homepage "https://qc.simse.io"
  url "https://github.com/simse/qc/archive/refs/tags/v0.8.5.tar.gz"
  sha256 "611906e56c4398b0878da12d81f42d0b7607aae253b28e904e7cbbff627034b2"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "vips"

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    ENV["CGO_ENABLED"] = "1"
    ENV["CGO_CFLAGS_ALLOW"] = "-Xpreprocessor"

    system "go", "run", "build.go", "--enable-cgo"

    bin.install "qc"
  end

  test do
    system "false"
  end
end
