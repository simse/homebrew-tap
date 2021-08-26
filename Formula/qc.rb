class Qc < Formula
  desc "Tool for converting between file formats"
  homepage "https://qc.simse.io"
  version "0.8.7"
  url "https://github.com/simse/qc.git", tag: "0.8.7", revision: "50a36a79dbf5a1a0cdabefa1f96c833192807f08"

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
