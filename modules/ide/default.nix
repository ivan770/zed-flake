_: {
  config = {
    userSettings = {
      # Enable auto save.
      autosave.after_delay.milliseconds = 1000;

      # Enable code lens support.
      code_lens = "on";

      # Enable inlay hints.
      inlay_hints.enabled = true;

      # Disable autoformatting.
      format_on_save = "off";

      # Disable workspace trust functionality.
      session.trust_all_worktrees = true;

      # Keep editor opened even after all tabs are closed.
      when_closing_with_no_tabs = "keep_window_open";

      # Exit Zed when the editor window is closed.
      on_last_window_closed = "quit_app";

      # Automatically restore the previous project on start.
      restore_on_startup = "last_workspace";

      # Prefer Zed UI over the native one.
      use_system_prompts = false;
      use_system_path_prompts = false;

      git = {
        # Minimise Git blame.
        blame.show_avatar = false;

        # Disable inline Git blame.
        inline_blame.enabled = false;

        # Disable Git gutter.
        git_gutter = "hide";
      };
    };

    # Always open new windows when trying to run repeatedly from CLI.
    flags."--classic" = true;
  };
}
