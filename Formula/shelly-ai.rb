class ShellyAi < Formula
  desc "AI-powered terminal assistant that converts natural language to shell commands"
  homepage "https://github.com/Jeff909Dev/shelly"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.0/shelly-ai-darwin-arm64.tar.gz"
      sha256 "8efc7698d4ca799f24c39b3a2c1ac9865a523291c8a2a393d0e0af181005e52b"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.0/shelly-ai-darwin-amd64.tar.gz"
      sha256 "9cb305d6c44a932658769d1de401908e45896b9922a65260ca2b97fe5d9d2909"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.0/shelly-ai-linux-arm64.tar.gz"
      sha256 "937ba7c0f1b93fd9c67b4cbd83f70ec5c810933b3de224b460663a47bc41767b"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.0/shelly-ai-linux-amd64.tar.gz"
      sha256 "49fe24831a10e37c1f062669e891d0f2006a6cbadfd7f8787bfe06c6042c479b"
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
