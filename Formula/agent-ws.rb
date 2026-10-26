class AgentWs < Formula
  desc "Instant, isolated workspaces for coding agents on macOS (APFS clone-on-write)"
  homepage "https://github.com/mendoanjoe/agent-ws"
  version "0.2.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.2.1/agent-ws-aarch64-apple-darwin.tar.gz"
    sha256 "8df23a4adc3dcf9c23ea2c3d9d40a711ac8ca3f3b3f73f2a6f57830b9ea096b9"
  else
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.2.1/agent-ws-x86_64-apple-darwin.tar.gz"
    sha256 "d75155aeff2c994ef96d5e75ff2c6b7534bbdaee49fac315ba01b1f24e812904"
  end

  def install
    bin.install "agent-ws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-ws --version")
  end
end
