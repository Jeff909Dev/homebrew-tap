class ShellyAi < Formula
  desc "AI-powered terminal assistant that converts natural language to shell commands"
  homepage "https://github.com/Jeff909Dev/shelly"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.1/shelly-ai-darwin-arm64.tar.gz"
      sha256 "cfb15fd5e12aca76557d291cb77a0924f2bf45de7b1886be7259a7c006702442"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.1/shelly-ai-darwin-amd64.tar.gz"
      sha256 "8ebce5cc2b498f12bf711bf859111fd60ef4d2263977d16878b72835501a000b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.1/shelly-ai-linux-arm64.tar.gz"
      sha256 "77fd8d4c201d2abe3938db879b17712e2eac2d698f9d4cf191876442a45042b8"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.1/shelly-ai-linux-amd64.tar.gz"
      sha256 "10ff3b961c7fad8eb208c39bc5f0d4ee0346d28ab0042b9fffa275861f082891"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "shelly-ai-darwin-arm64" => "shelly-ai"
      else
        bin.install "shelly-ai-darwin-amd64" => "shelly-ai"
      end
    else
      if Hardware::CPU.arm?
        bin.install "shelly-ai-linux-arm64" => "shelly-ai"
      else
        bin.install "shelly-ai-linux-amd64" => "shelly-ai"
      end
    end
    bin.install_symlink "shelly-ai" => "q"
  end

  test do
    assert_match "command line interface", shell_output("#{bin}/shelly-ai --help")
  end
end
