class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-project-profile"
  url "https://github.com/yarikleto/claude-project-profile/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "060bd1107171fc545921dc7451a9c758db8ba3104bac100a3f7b498bc01555a5"
  license "MIT"

  depends_on "bash"

  def install
    libexec.install "lib", "commands"
    bin.install "claude-project-profile"
    inreplace bin/"claude-project-profile",
      /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{libexec}\""
    zsh_completion.install "completions/_claude-project-profile"
    bash_completion.install "completions/claude-project-profile.bash" => "claude-project-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-project-profile version")
  end
end
