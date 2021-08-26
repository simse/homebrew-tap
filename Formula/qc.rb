class Qc < Formula
  desc "A tool for converting between file formats"
  homepage "https://qc.simse.io"
  url "https://github.com/simse/qc/archive/refs/tags/v0.8.5.tar.gz"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "vips" => :build
  depends_on "vips"

  def install
    install
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