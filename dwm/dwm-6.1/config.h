/* See LICENSE file for copyright and license details. */

/* appearance */
// static const char *fonts[] = {
//     "PragmataPro:size=10.5",
//     "Sans:size=10.5",
//     "VL Gothic:size=10.5",
//     "WenQuanYi Micro Hei:size=10.5",
// };
static const char *fonts[] = {
    "Terminus:size=10",
    "PragmataPro:size=10",
    "Sans:size=10.5",
};

static const char dmenufont[]       = "Terminus:size=10";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#CC4400";
static const char selbgcolor[]      = "#000000";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            True,        -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       False,       -1 },
};

/* layout(s) */
static const float mfact      = 0.62;  /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;     /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "mate-terminal", "-e", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
// static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *dmenucmd[]   = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]    = { "mate-terminal", NULL };
static const char *prtscrcmd[]  = { "scrot", "/home/peko/Pictures/%Y.%m.%d-%H%M%S-$wx$h.png", "--quality", "100", "-u",  NULL };
static const char *explorefs[]  = { "caja", "--no-desktop",  NULL };
static const char *sublimecmd[] = { "subl", NULL };
static const char *browsercmd[] = { "google-chrome",  NULL };
static const char *telegramcmd[] = { "/home/peko/Tools/Telegram/Telegram",  NULL };
static const char *teleclicmd[] = { "mate-terminal", "--working-directory=/home/peko/Tools/telegram-cli/","-e", "./bin/telegram-cli",  NULL };


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd   } },
	{ MODKEY,                       XK_w,      spawn,          {.v = explorefs  } },
	{ MODKEY,                       XK_g,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_s,      spawn,          {.v = sublimecmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd    } },
	{ 0,                            XK_Print,  spawn,          {.v = prtscrcmd  } },
	
	{ MODKEY,                       XK_h,      spawn,          SHCMD("htop") },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          SHCMD("less +F /home/peko/.xsession-errors") },
	{ MODKEY,                       XK_y,      spawn,          SHCMD("ping ya.ru") },
	{ MODKEY,                       XK_d,      spawn,          {.v = telegramcmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = teleclicmd  } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },

	// { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	// { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	// { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	// { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	// { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	// { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_e,      focusstack,     {.i = +1   } }, //
	{ MODKEY,                       XK_o,      focusstack,     {.i = -1   } }, //
	{ MODKEY,                       XK_k,      incnmaster,     {.i = +1   } }, //
	{ MODKEY,                       XK_l,      incnmaster,     {.i = -1   } }, //
	{ MODKEY,                       XK_n,      setmfact,       {.f = -0.05} }, //
	{ MODKEY,                       XK_i,      setmfact,       {.f = +0.05} }, //

	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	
	{ MODKEY,                       XK_q,      killclient,     {0} },
	
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

