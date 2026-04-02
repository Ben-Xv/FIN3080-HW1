/********************************************************************
FIN3080 HW1 - Bubble Indicators (Stata workflow scaffold)
Author: generated with Codex
Purpose:
  1) Provide a clean, reproducible pipeline for all required indicators.
  2) Allow iterative “one-question-at-a-time” collaboration.
********************************************************************/

version 17
clear all
set more off

*========================*
* 0) Project Path Setup  *
*========================*
* 请改成你本机作业文件夹路径
global ROOT "."
cd "$ROOT"

* 输出目录
cap mkdir output
cap mkdir output/tables
cap mkdir output/figures
cap mkdir output/temp

*===============================*
* 1) Define Three Bull Episodes *
*===============================*
* 2015 episode
local s2015 = date("2014-06-19", "YMD")
local e2015 = date("2015-06-12", "YMD")

* 2021 episode
local s2021 = date("2019-01-04", "YMD")
local e2021 = date("2021-02-18", "YMD")

* Current episode (per assignment)
local scur  = date("2024-09-18", "YMD")
local ecur  = date("2026-03-09", "YMD")
local ecur_m = mofd(date("2026-02-01", "YMD"))   // funds ratio end month fixed to 2026m2

* historical cutoff for percentile distribution (before each bubble)
local hist2015_end = date("2013-12-31", "YMD")
local hist2021_end = date("2018-12-31", "YMD")
local histcur_end  = date("2024-09-17", "YMD")

*===============================*
* 2) Standardize Date Variables *
*===============================*
* 你需要按实际变量名调整：
* - 如果原始日期是字符串（如 "2014-06-19"），先用 date(strvar,"YMD")
* - 如果已是 Stata daily date，确认 format %td

* 示例模板（不要直接运行，先替换 varname）：
* use "1.4.1a value of shares traded.dta", clear
* gen tdate = <your_date_var>
* format tdate %td
* save output/temp/trading_value_std.dta, replace

*=============================================================*
* 3) Indicator Checklist (compute for 2015/2021/current end)  *
*=============================================================*

* Q1 Trading Value Ratio
*   ratio = trading_value(end) / trading_value(start)

* Q2 Maximum Trading Value Ratio + SSE pre/post peak return
*   max_ratio = max(trading_value within episode) / trading_value(start)
*   pre_peak_return  = price_peak/price_start - 1
*   post_peak_return = price_end/price_peak - 1

* Q3 Margin Trading Balance Ratio
*   ratio = margin_balance(end) / margin_balance(start)

* Q4 New Issuance of Equity-Oriented Funds (monthly ratio)
*   ratio = fund_shares(end_month) / fund_shares(start_month)
*   current episode end_month = 2026m2
*   if start/end month missing, pick nearest month within episode interval

* Q5 CSI300 ERP level + percentile changes
*   ERP = 1/PE - y10
*   analyze: (a) level change start->end
*            (b) percentile change based on empirical CDF built from history ending before bubble

* Q6 (CSI300 dividend yield - y10) level + percentile changes
*   same percentile method as Q5

* Q7 Representative stock price changes
*   fixed: 300059.SZ, 600570.SH
*   + brokerage stock with largest increase in each episode
*   current-episode trend chart: East Money, Hundsun, and best brokerage stock (whole interval fixed best)

*==================================================*
* 4) Trend Plots for Current Episode (to 2026-03-09)
*==================================================*
* 对每个指标构造“从起点累计到当日”的时间序列，再画图。
* 建议每个指标单独一张图，命名：
*   output/figures/current_Q1.png ... current_Q7.png

*=====================================*
* 5) Suggested Execution Order (Do now)
*=====================================*
* Step A: 数据核对（变量名、日期格式、单位）
* Step B: 先做 Q1（最简单，验证流程）
* Step C: 按 Q2->Q7 依次做，边做边导出结果表
* Step D: 最后统一写结论（early/mid/late stage）

*=================================*
* 6) Minimal Output Table Template *
*=================================*
* 输出表建议列：
* indicator | episode_2015 | episode_2021 | episode_current | interpretation

* 你每做完一题，都可以把结果粘贴给我，我会继续给下一题代码 + 文字结论模板。

display "Workflow scaffold loaded. Start with Q1 next."
