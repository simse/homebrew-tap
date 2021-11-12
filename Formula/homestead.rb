class Homestead < Formula
  desc "Tool for creating local, isolated development environments"
  homepage "https://homestead.simse.io"
  version "0.0.1"
  url "https://github.com/simse/homestead.git", tag: "0.0.1", revision: "d99305c7eb721994edcbc57d3f01abe99a0f0f9a"

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
