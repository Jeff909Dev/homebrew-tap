class ShellyAi < Formula
  desc "AI-powered terminal assistant that converts natural language to shell commands"
  homepage "https://github.com/Jeff909Dev/shelly"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.0.0/shelly-ai-darwin-arm64.tar.gz"
      sha256 "161f023428528175652a612c8318215ff3a7c7a32aaa57b296568f159f43a640"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.0.0/shelly-ai-darwin-amd64.tar.gz"
      sha256 "edb755a3992786ac2480c5730f5b841a32a8f24e56e98f1ea9757a7d3df95994"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.0.0/shelly-ai-linux-arm64.tar.gz"
      sha256 "a9b8f3eb374b457759edfeb5d2ca12595e68fa1015fb82bea5563bedd75e5bcf"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.0.0/shelly-ai-linux-amd64.tar.gz"
      sha256 "9017764ed52a94d1e15785f9c897b37904bbca03b5d6c331dc10f40dec09835d"
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
