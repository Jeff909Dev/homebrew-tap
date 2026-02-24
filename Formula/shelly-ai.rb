class ShellyAi < Formula
  desc "AI-powered terminal assistant that converts natural language to shell commands"
  homepage "https://github.com/Jeff909Dev/shelly"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.2/shelly-ai-darwin-arm64.tar.gz"
      sha256 "aa2bb31e2637bac7c8ac63621f77e149ecef01ae624a4b4aa60112befe4aa631"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.2/shelly-ai-darwin-amd64.tar.gz"
      sha256 "7750e95ee2d5c970baf92010dff5eee34a08b214abd54a9a516cfb00c1ce8e30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.2/shelly-ai-linux-arm64.tar.gz"
      sha256 "815b6c2cc3daadeb8b7877a3859cb1758eb298f3edb03abb124b308735a9b132"
    else
      url "https://github.com/Jeff909Dev/shelly/releases/download/v1.1.2/shelly-ai-linux-amd64.tar.gz"
      sha256 "eb2bf84a3b7a9eb51135f8b7aca9ae4c6b3ff2c263848a09ad468514408fdf65"
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
