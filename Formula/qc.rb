class Qc < Formula
  desc "Tool for converting between file formats"
  homepage "https://qc.simse.io"
  version "0.8.8"
  url "https://github.com/simse/qc.git", tag: "0.8.8", revision: "95fd6d6a11bda7e3233f618398a842480b1161cb"

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
