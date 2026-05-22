_: {
  config.userSettings = {
    # Basic UI configuration.
    theme = "Carbonfox - opaque";

    # Slightly reduce the default font size.
    buffer_font_size = "14.00";

    # Disable current line highlight.
    current_line_highlight = "none";

    # Disable unused history navigation buttons.
    tab_bar.show_nav_history_buttons = false;

    # Hide Git information in the scrollbar.
    scrollbar.git_diff = false;

    tabs = {
      # Always show the tab close button.
      show_close_button = "always";

      # Mark tabs with errors to make them more visible.
      show_diagnostics = "errors";

      # Navigate to the previous file when closing the current tab.
      activate_on_close = "history";

      # Show file type icons in the tab bar.
      file_icons = true;

      # Disable Git status in the tab bar.
      git_status = false;
    };

    # Disable toolbar entirely.
    toolbar = {
      breadcrumbs = false;
      quick_actions = false;
      selections_menu = false;
      agent_review = false;
    };

    title_bar = {
      # Hide unused account functionality.
      show_user_menu = false;
      show_user_picture = false;
      show_sign_in = false;
      show_onboarding_banner = false;
    };

    gutter = {
      # Reduce gutter size.
      min_line_number_digits = 2;

      # Folds are unused in this configuration.
      folds = false;
    };

    # Move file explorer to the right side.
    project_panel.dock = "right";

    # Always display the current file encoding.
    status_bar.active_encoding_button = "enabled";
  };
}
