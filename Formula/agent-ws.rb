class AgentWs < Formula
  desc "Instant, isolated workspaces for coding agents on macOS (APFS clone-on-write)"
  homepage "https://github.com/mendoanjoe/agent-ws"
  version "0.3.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.3.0/agent-ws-aarch64-apple-darwin.tar.gz"
    sha256 "00126bda111a73354102bd0e83c07bc1a4538dd90ab0ef35c1609eb2d428c526"
  else
    url "https://github.com/mendoanjoe/agent-ws/releases/download/v0.3.0/agent-ws-x86_64-apple-darwin.tar.gz"
    sha256 "0e6ee8018973f9f1b6f75b4df7e0763d685579c2581f0643376debb5d3ede290"
  end

  def install
    bin.install "agent-ws"
    generate_completions_from_executable(bin/"agent-ws", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-ws --version")
  end
end
