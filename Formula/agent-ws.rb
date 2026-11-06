class AgentWs < Formula
  desc "Instant, isolated workspaces for coding agents on macOS (APFS clone-on-write)"
  homepage "https://github.com/mendoanjoe/agent-ws"
  version "0.4.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.4.0/agent-ws-aarch64-apple-darwin.tar.gz"
    sha256 "4fecce29ef19c89863c4660ee133fab991214129c65eaa61219023d906441ae7"
  else
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.4.0/agent-ws-x86_64-apple-darwin.tar.gz"
    sha256 "a33abd6cb25371bc9d608d65543828c0bf3564c1cab94060f3b72cae4c82ec2b"
  end

  def install
    bin.install "agent-ws"
    generate_completions_from_executable(bin/"agent-ws", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-ws --version")
  end
end
