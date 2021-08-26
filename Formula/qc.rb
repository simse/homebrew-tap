class Qc < Formula
  desc "qc is a tool for converting between file formats"
  homepage "https://qc.simse.io"
  version "v0.8.5"
  url "https://github.com/simse/qc.git", tag: "v0.8.5", revision: "08eac98cda4b2301662be646c6684782a09c10fc"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
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
