// SchoolVM Firefox preferences
pref("browser.startup.homepage", "https://www.google.com");
pref("browser.startup.page", 1);

// Disable telemetry
pref("toolkit.telemetry.enabled", false);
pref("toolkit.telemetry.unified", false);
pref("datareporting.healthreport.uploadEnabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);

// Disable first-run pages
pref("browser.startup.homepage_override.mstone", "ignore");
pref("startup.homepage_welcome_url", "");
pref("startup.homepage_welcome_url.additional", "");

// Disable default browser check
pref("browser.shell.checkDefaultBrowser", false);

// Enable hardware acceleration
pref("gfx.webrender.all", true);
