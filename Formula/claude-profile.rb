class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-profile"
  url "https://github.com/yarikleto/claude-profile/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5b4a77444e136ff88085c35dd31ba237ad803ca70b864d91a133de2f57965cfc"
  license "MIT"

  depends_on "bash"

  def install
    # Install supporting modules to libexec (Homebrew's private dir for the formula)
    libexec.install "lib", "commands"

    # Install main script and patch SCRIPT_DIR to find modules in libexec
    bin.install "claude-profile"
    inreplace bin/"claude-profile",
      /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{libexec}\""

    # Install shell completions (Homebrew links these automatically)
    zsh_completion.install "completions/claude-profile.zsh" => "_claude-profile"
    bash_completion.install "completions/claude-profile.bash" => "claude-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-profile version")
  end
end
