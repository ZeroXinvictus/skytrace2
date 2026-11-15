import 'package:flutter/material.dart';

import 'package:iconoir_flutter/regular/antenna_signal.dart' as i_antenna_signal;
import 'package:iconoir_flutter/regular/arrow_down.dart' as i_arrow_down;
import 'package:iconoir_flutter/regular/arrow_right.dart' as i_arrow_right;
import 'package:iconoir_flutter/regular/arrow_up.dart' as i_arrow_up;
import 'package:iconoir_flutter/regular/badge_check.dart' as i_badge_check;
import 'package:iconoir_flutter/regular/check.dart' as i_check;
import 'package:iconoir_flutter/regular/check_circle.dart' as i_check_circle;
import 'package:iconoir_flutter/regular/clock.dart' as i_clock;
import 'package:iconoir_flutter/regular/code.dart' as i_code;
import 'package:iconoir_flutter/regular/code_brackets_square.dart' as i_code_brackets_square;
import 'package:iconoir_flutter/regular/control_slider.dart' as i_control_slider;
import 'package:iconoir_flutter/regular/copy.dart' as i_copy;
import 'package:iconoir_flutter/regular/cpu.dart' as i_cpu;
import 'package:iconoir_flutter/regular/dashboard_speed.dart' as i_dashboard_speed;
import 'package:iconoir_flutter/regular/download.dart' as i_download;
import 'package:iconoir_flutter/regular/edit_pencil.dart' as i_edit_pencil;
import 'package:iconoir_flutter/regular/eye.dart' as i_eye;
import 'package:iconoir_flutter/regular/filter.dart' as i_filter;
import 'package:iconoir_flutter/regular/flash.dart' as i_flash;
import 'package:iconoir_flutter/regular/globe.dart' as i_globe;
import 'package:iconoir_flutter/regular/graph_up.dart' as i_graph_up;
import 'package:iconoir_flutter/regular/home_simple.dart' as i_home_simple;
import 'package:iconoir_flutter/regular/hourglass.dart' as i_hourglass;
import 'package:iconoir_flutter/regular/info_circle.dart' as i_info_circle;
import 'package:iconoir_flutter/regular/key.dart' as i_key;
import 'package:iconoir_flutter/regular/list.dart' as i_list;
import 'package:iconoir_flutter/regular/lock.dart' as i_lock;
import 'package:iconoir_flutter/regular/lock_slash.dart' as i_lock_slash;
import 'package:iconoir_flutter/regular/magic_wand.dart' as i_magic_wand;
import 'package:iconoir_flutter/regular/nav_arrow_down.dart' as i_nav_arrow_down;
import 'package:iconoir_flutter/regular/page.dart' as i_page;
import 'package:iconoir_flutter/regular/pause.dart' as i_pause;
import 'package:iconoir_flutter/regular/play.dart' as i_play;
import 'package:iconoir_flutter/regular/plus.dart' as i_plus;
import 'package:iconoir_flutter/regular/prohibition.dart' as i_prohibition;
import 'package:iconoir_flutter/regular/refresh.dart' as i_refresh;
import 'package:iconoir_flutter/regular/search.dart' as i_search;
import 'package:iconoir_flutter/regular/send.dart' as i_send;
import 'package:iconoir_flutter/regular/settings.dart' as i_settings;
import 'package:iconoir_flutter/regular/share_android.dart' as i_share_android;
import 'package:iconoir_flutter/regular/shield.dart' as i_shield;
import 'package:iconoir_flutter/regular/skip_next.dart' as i_skip_next;
import 'package:iconoir_flutter/regular/smartphone_device.dart' as i_smartphone_device;
import 'package:iconoir_flutter/regular/stats_report.dart' as i_stats_report;
import 'package:iconoir_flutter/regular/system_shut.dart' as i_system_shut;
import 'package:iconoir_flutter/regular/timer.dart' as i_timer;
import 'package:iconoir_flutter/regular/trash.dart' as i_trash;
import 'package:iconoir_flutter/regular/warning_circle.dart' as i_warning_circle;
import 'package:iconoir_flutter/regular/xmark.dart' as i_xmark;

typedef GlyphBuilder = Widget Function(double size, Color color);

class AppGlyph {
  const AppGlyph(this.build);

  final GlyphBuilder build;
}

Widget _globe(double s, Color c) => i_globe.Globe(width: s, height: s, color: c);
Widget _pause(double s, Color c) => i_pause.Pause(width: s, height: s, color: c);
Widget _ban(double s, Color c) => i_prohibition.Prohibition(width: s, height: s, color: c);
Widget _mobileScreen(double s, Color c) => i_smartphone_device.SmartphoneDevice(width: s, height: s, color: c);
Widget _copy(double s, Color c) => i_copy.Copy(width: s, height: s, color: c);
Widget _circleExclamation(double s, Color c) => i_warning_circle.WarningCircle(width: s, height: s, color: c);
Widget _lock(double s, Color c) => i_lock.Lock(width: s, height: s, color: c);
Widget _circleCheck(double s, Color c) => i_check_circle.CheckCircle(width: s, height: s, color: c);
Widget _wandMagic(double s, Color c) => i_magic_wand.MagicWand(width: s, height: s, color: c);
Widget _trash(double s, Color c) => i_trash.Trash(width: s, height: s, color: c);
Widget _shieldHalved(double s, Color c) => i_shield.Shield(width: s, height: s, color: c);
Widget _list(double s, Color c) => i_list.List(width: s, height: s, color: c);
Widget _gear(double s, Color c) => i_settings.Settings(width: s, height: s, color: c);
Widget _eye(double s, Color c) => i_eye.Eye(width: s, height: s, color: c);
Widget _circleInfo(double s, Color c) => i_info_circle.InfoCircle(width: s, height: s, color: c);
Widget _certificate(double s, Color c) => i_badge_check.BadgeCheck(width: s, height: s, color: c);
Widget _arrowsRotate(double s, Color c) => i_refresh.Refresh(width: s, height: s, color: c);
Widget _share(double s, Color c) => i_share_android.ShareAndroid(width: s, height: s, color: c);
Widget _powerOff(double s, Color c) => i_system_shut.SystemShut(width: s, height: s, color: c);
Widget _paperPlane(double s, Color c) => i_send.Send(width: s, height: s, color: c);
Widget _fileLines(double s, Color c) => i_page.Page(width: s, height: s, color: c);
Widget _download(double s, Color c) => i_download.Download(width: s, height: s, color: c);
Widget _code(double s, Color c) => i_code.Code(width: s, height: s, color: c);
Widget _arrowUp(double s, Color c) => i_arrow_up.ArrowUp(width: s, height: s, color: c);
Widget _arrowRight(double s, Color c) => i_arrow_right.ArrowRight(width: s, height: s, color: c);
Widget _arrowDown(double s, Color c) => i_arrow_down.ArrowDown(width: s, height: s, color: c);
Widget _xmark(double s, Color c) => i_xmark.Xmark(width: s, height: s, color: c);
Widget _stopwatch(double s, Color c) => i_timer.Timer(width: s, height: s, color: c);
Widget _sliders(double s, Color c) => i_control_slider.ControlSlider(width: s, height: s, color: c);
Widget _plus(double s, Color c) => i_plus.Plus(width: s, height: s, color: c);
Widget _play(double s, Color c) => i_play.Play(width: s, height: s, color: c);
Widget _pen(double s, Color c) => i_edit_pencil.EditPencil(width: s, height: s, color: c);
Widget _magnifyingGlass(double s, Color c) => i_search.Search(width: s, height: s, color: c);
Widget _lockOpen(double s, Color c) => i_lock_slash.LockSlash(width: s, height: s, color: c);
Widget _key(double s, Color c) => i_key.Key(width: s, height: s, color: c);
Widget _hourglass(double s, Color c) => i_hourglass.Hourglass(width: s, height: s, color: c);
Widget _gauge(double s, Color c) => i_dashboard_speed.DashboardSpeed(width: s, height: s, color: c);
Widget _check(double s, Color c) => i_check.Check(width: s, height: s, color: c);
Widget _bolt(double s, Color c) => i_flash.Flash(width: s, height: s, color: c);
Widget _signal(double s, Color c) => i_antenna_signal.AntennaSignal(width: s, height: s, color: c);
Widget _rotate(double s, Color c) => i_refresh.Refresh(width: s, height: s, color: c);
Widget _robot(double s, Color c) => i_cpu.Cpu(width: s, height: s, color: c);
Widget _house(double s, Color c) => i_home_simple.HomeSimple(width: s, height: s, color: c);
Widget _forward(double s, Color c) => i_skip_next.SkipNext(width: s, height: s, color: c);
Widget _filter(double s, Color c) => i_filter.Filter(width: s, height: s, color: c);
Widget _fileCode(double s, Color c) => i_code_brackets_square.CodeBracketsSquare(width: s, height: s, color: c);
Widget _fileArrowDown(double s, Color c) => i_download.Download(width: s, height: s, color: c);
Widget _clock(double s, Color c) => i_clock.Clock(width: s, height: s, color: c);
Widget _chevronDown(double s, Color c) => i_nav_arrow_down.NavArrowDown(width: s, height: s, color: c);
Widget _chartPie(double s, Color c) => i_stats_report.StatsReport(width: s, height: s, color: c);
Widget _chartLine(double s, Color c) => i_graph_up.GraphUp(width: s, height: s, color: c);
Widget _android(double s, Color c) => i_smartphone_device.SmartphoneDevice(width: s, height: s, color: c);

class AppIcons {
  const AppIcons._();

  static const AppGlyph globe = AppGlyph(_globe);
  static const AppGlyph pause = AppGlyph(_pause);
  static const AppGlyph ban = AppGlyph(_ban);
  static const AppGlyph mobileScreen = AppGlyph(_mobileScreen);
  static const AppGlyph copy = AppGlyph(_copy);
  static const AppGlyph circleExclamation = AppGlyph(_circleExclamation);
  static const AppGlyph lock = AppGlyph(_lock);
  static const AppGlyph circleCheck = AppGlyph(_circleCheck);
  static const AppGlyph wandMagic = AppGlyph(_wandMagic);
  static const AppGlyph trash = AppGlyph(_trash);
  static const AppGlyph shieldHalved = AppGlyph(_shieldHalved);
  static const AppGlyph list = AppGlyph(_list);
  static const AppGlyph gear = AppGlyph(_gear);
  static const AppGlyph eye = AppGlyph(_eye);
  static const AppGlyph circleInfo = AppGlyph(_circleInfo);
  static const AppGlyph certificate = AppGlyph(_certificate);
  static const AppGlyph arrowsRotate = AppGlyph(_arrowsRotate);
  static const AppGlyph share = AppGlyph(_share);
  static const AppGlyph powerOff = AppGlyph(_powerOff);
  static const AppGlyph paperPlane = AppGlyph(_paperPlane);
  static const AppGlyph fileLines = AppGlyph(_fileLines);
  static const AppGlyph download = AppGlyph(_download);
  static const AppGlyph code = AppGlyph(_code);
  static const AppGlyph arrowUp = AppGlyph(_arrowUp);
  static const AppGlyph arrowRight = AppGlyph(_arrowRight);
  static const AppGlyph arrowDown = AppGlyph(_arrowDown);
  static const AppGlyph xmark = AppGlyph(_xmark);
  static const AppGlyph stopwatch = AppGlyph(_stopwatch);
  static const AppGlyph sliders = AppGlyph(_sliders);
  static const AppGlyph plus = AppGlyph(_plus);
  static const AppGlyph play = AppGlyph(_play);
  static const AppGlyph pen = AppGlyph(_pen);
  static const AppGlyph magnifyingGlass = AppGlyph(_magnifyingGlass);
  static const AppGlyph lockOpen = AppGlyph(_lockOpen);
  static const AppGlyph key = AppGlyph(_key);
  static const AppGlyph hourglass = AppGlyph(_hourglass);
  static const AppGlyph gauge = AppGlyph(_gauge);
  static const AppGlyph check = AppGlyph(_check);
  static const AppGlyph bolt = AppGlyph(_bolt);
  static const AppGlyph signal = AppGlyph(_signal);
  static const AppGlyph rotate = AppGlyph(_rotate);
  static const AppGlyph robot = AppGlyph(_robot);
  static const AppGlyph house = AppGlyph(_house);
  static const AppGlyph forward = AppGlyph(_forward);
  static const AppGlyph filter = AppGlyph(_filter);
  static const AppGlyph fileCode = AppGlyph(_fileCode);
  static const AppGlyph fileArrowDown = AppGlyph(_fileArrowDown);
  static const AppGlyph clock = AppGlyph(_clock);
  static const AppGlyph chevronDown = AppGlyph(_chevronDown);
  static const AppGlyph chartPie = AppGlyph(_chartPie);
  static const AppGlyph chartLine = AppGlyph(_chartLine);
  static const AppGlyph android = AppGlyph(_android);
}

class Ico extends StatelessWidget {
  const Ico(this.glyph, {super.key, this.size, this.color});

  final AppGlyph glyph;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = IconTheme.of(context);
    final resolvedSize = size ?? theme.size ?? 24;
    final resolvedColor = color ?? theme.color ?? Theme.of(context).colorScheme.onSurface;
    return SizedBox(
      width: resolvedSize,
      height: resolvedSize,
      child: glyph.build(resolvedSize, resolvedColor),
    );
  }
}
