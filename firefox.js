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
pref("gfx.webrender.compositor", true);

// Disable animations to reduce VNC redraws
pref("browser.tabs.animate", false);
pref("toolkit.cosmeticAnimations.enabled", false);
pref("ui.prefersReducedMotion", 1);
pref("browser.fullscreen.animate", false);

// Video playback optimizations
pref("media.av1.enabled", false);
pref("media.hardware-video-decoding.enabled", true);
pref("media.hardware-video-decoding.force-enabled", true);
pref("media.ffmpeg.vaapi.enabled", true);

// Disable unnecessary background services
pref("extensions.pocket.enabled", false);
pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
pref("browser.newtabpage.activity-stream.telemetry", false);
pref("browser.newtabpage.activity-stream.feeds.snippets", false);
pref("browser.ping-centre.telemetry", false);
