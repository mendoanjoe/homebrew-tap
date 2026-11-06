class AgentWs < Formula
  desc "Instant, isolated workspaces for coding agents on macOS (APFS clone-on-write)"
  homepage "https://github.com/mendoanjoe/agent-ws"
  version "0.2.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.2.2/agent-ws-aarch64-apple-darwin.tar.gz"
    sha256 "3dd2dc01ff72b8f69463dd55d6e180d1bc02f3889fd12cd72a2683fb7eb6f245"
  else
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.2.2/agent-ws-x86_64-apple-darwin.tar.gz"
    sha256 "00d9e69050a5607d7925e87ffe87b1f4219a40342bc84aac00684b1cfbd78362"
  end

  def install
    bin.install "agent-ws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-ws --version")
  end
end
