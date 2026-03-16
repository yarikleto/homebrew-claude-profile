class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-profile"
  url "https://github.com/yarikleto/claude-profile/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "bea84c13e199ef00dd7546fbb56f6912b1474dff1148d4bbaf69e0d9f4b3f0bf"
  license "MIT"

  depends_on "bash"

  def install
    libexec.install "lib", "commands"
    bin.install "claude-profile"
    inreplace bin/"claude-profile",
      /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{libexec}\""
    zsh_completion.install "completions/claude-profile.zsh" => "_claude-profile"
    bash_completion.install "completions/claude-profile.bash" => "claude-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-profile version")
  end
end
