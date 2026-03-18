class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-profile"
  url "https://github.com/yarikleto/claude-profile/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "c693f851c60c60adeab5fb258e3b8e33332faef6c0bd31232f6260f9e7cc5758"
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
