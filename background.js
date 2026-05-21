/**
 * Keyboard shortcut (chrome.commands) → toggle caption reflow on the active YouTube tab.
 * activeTab applies when the shortcut is invoked (see Chrome docs for commands + activeTab).
 */
const TOGGLE_COMMAND = "toggle-budoux-captions";

function isInjectableYouTubeUrl(url) {
  if (!url) return false;
  try {
    const u = new URL(url);
    if (u.protocol !== "https:") return false;
    const h = u.hostname;
    return h === "www.youtube.com" || h === "youtube.com" || h === "m.youtube.com";
  } catch {
    return false;
  }
}

/** Toolbar icon tooltip: reflects the user’s current shortcut from chrome://extensions/shortcuts */
async function refreshActionTitle() {
  try {
    const cmds = await chrome.commands.getAll();
    const c = cmds.find((x) => x.name === TOGGLE_COMMAND);
    const shortcut = (c?.shortcut && String(c.shortcut).trim()) || "";
    const name = "Better Japanese Captions";
    const title = shortcut
      ? `${name} — ショートカット: ${shortcut}`
      : `${name} — ショートカット未設定（chrome://extensions/shortcuts で変更）`;
    await chrome.action.setTitle({ title });
  } catch {
    /* ignore */
  }
}

chrome.runtime.onInstalled.addListener(() => {
  void refreshActionTitle();
});
chrome.runtime.onStartup.addListener(() => {
  void refreshActionTitle();
});

chrome.runtime.onMessage.addListener((msg, _sender, respond) => {
  if (msg?.type === "BUDOUX_GET_TOGGLE_SHORTCUT") {
    chrome.commands.getAll().then((cmds) => {
      const c = cmds.find((x) => x.name === TOGGLE_COMMAND);
      const shortcut = (c?.shortcut && String(c.shortcut).trim()) || "";
      void refreshActionTitle();
      respond({ shortcut });
    });
    return true;
  }
  return void 0;
});

chrome.commands.onCommand.addListener((command) => {
  if (command !== TOGGLE_COMMAND) return;
  void refreshActionTitle();
  chrome.tabs.query({ active: true, lastFocusedWindow: true }, (tabs) => {
    const tab = tabs[0];
    if (!tab?.id) return;
    const url = tab.url ?? tab.pendingUrl ?? "";
    if (!isInjectableYouTubeUrl(url)) return;
    chrome.tabs.sendMessage(
      tab.id,
      { type: "BUDOUX_TOGGLE_HOTKEY" },
      { frameId: 0 },
      () => {
        void chrome.runtime.lastError;
      }
    );
  });
});
