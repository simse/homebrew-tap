class Homestead < Formula
  desc "Tool for creating local, isolated development environments"
  homepage "https://homestead.simse.io"
  version "0.0.3"
  url "https://github.com/simse/homestead.git", tag: "0.0.3", revision: "9062ee93f92948e5eb5dc660c34e2b3b051fc866"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"

    system "go", "build", "homestead.go"

    bin.install "homestead"
  end

  test do
    system "false"
  end
end
