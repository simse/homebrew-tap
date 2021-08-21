class Qc < Formula
    desc "qc is a tool for converting between file formats"
    homepage "https://qc.simse.io"
    url "https://github.com/simse/qc/archive/refs/tags/v0.8.0.tar.gz"
    sha256 "0d2bcaf7aa28c2955bbba02426da08262ab8da0cd7c149b366230b35e5d12268"
    license "GPL-3.0"
  
    depends_on "go" => :build
    depends_on "libvips-dev" => :build
    depends_on "pkg-config" => :build
    depends_on "libvips"
  
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
  