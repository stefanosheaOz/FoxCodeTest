//
//  Player.swift
//  FoxCodable
//
//  Created by Macbook Pro on 03/08/2018.
//  Copyright © 2018 stefanoshea. All rights reserved.
//

struct PlayerStats: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case errors, goals, intercepted,
        intercepts, kicks, points, possessions, runs, tackles, tries
        case minsPlayed = "mins_played"
        case attackingKicks = "attacking_kicks"
        case bombsCaught    = "bombs_caught"
        case bombsDropped   = "bombs_dropped"
        case chargedDown    = "charged_down"
        case chargesDown    = "charges_down"
        case dropOuts       = "drop_Outs"
        case dummyHalfRuns  = "dummy_half_runs"
        case effectiveOffloads  = "effective_offloads"
        case fantasyPoints      = "fantasy_points"
        case fieldGoalAttampts  = "field_goal_attempts"
        case fieldGoalMissed    = "field_goal_misses"
        case fieldGoals         = "field_goals"
        case forcedDropOuts     = "forced_drop_outs"
        case generalPlayPass   = "general_play_pass"
        case goalMisses         = "goal_misses"
        case ineffectiveTackles = "ineffective_tackles"
        case inGoalEscapes      = "in_goal_escapes"
        case interchangedOff    = "interchanges_off"
        case interchangesOn     = "interchanges_on"
        case kickErrors         = "kick_errors"
        case kickMetres         = "kick_metres"
        case kickReturnMetres   = "kick_return_metres"
        case kickReturns        = "kick_returns"
        case kicks4020          = "kicks_4020"
        case kicksDead          = "kicks_dead"
        case lastTouchTryAssists    = "last_touch_try_assists"
        case lineBreakAssists       = "line_break_assists"
        case lineBreakCauses        = "line_break_causes"
        case lineBreaks             = "line_breaks"
        case lineEngagements        = "line_engagements"
        case longKicks          = "long_kicks"
        case missedTackles      = "missed_tackles"
        case offLoads           = "off_loads"
        case onePassRuns        = "one_pass_runs"
        case penaltiesConceded  = "penalties_conceded"
        case playeTheBalls      = "play_the_balls"
        case runMetres          = "run_metres"
        case runs7lessMeters    = "runs_7less_meters"
        case runs8plusMeters    = "runs_8plus_meters"
        case sendOffs           = "send_offs"
        case sinBins            = "sin_bins"
        case stealsOneOnOne     = "steals_one_on_one"
        case stolenOneOnOne     = "stolen_one_on_one"
        case tackleBusts        = "tackle_busts"
        case tackledOpp20       = "tackled_opp20"
        case tackleOppHalf      = "tackle_opp_half"
        case tacklesOneOnOne    = "tackles_one_on_one"
        case tryAssists         = "try_assists"
        case tryCauses          = "try_causes"
        case tryContPercent     = "try_contribution_percentage"
        case tryContributions   = "try_contributions"
        case tryInvolvements    = "try_involvements"
        case twentyMetreRestarts = "twenty_metre_restarts"
        case weightedKicks      = "weighted_kicks"
    }

    let errors:     Int?
    let goals:      Int?
    let intercepted: Int?
    let intercepts:  Int?
    let kicks:      Int?
    let points:     Int?
    let possessions: Int?
    let runs:        Int?
    let tackles:    Int?
    let tries:      Int?
    let minsPlayed: Int?
    let attackingKicks: Int?
    let bombsCaught :   Int?
    let bombsDropped:   Int?
    let chargedDown:    Int?
    let chargesDown:    Int?
    let dropOuts:       Int?
    let dummyHalfRuns:  Int?
    let effectiveOffloads:  Int?
    let fantasyPoints:      Int?
    let fieldGoalAttampts:  Int?
    let fieldGoalMissed:    Int?
    let fieldGoals:         Int?
    let forcedDropOuts:     Int?
    let generalPlayPass:    Int?
    let goalMisses:         Int?
    let ineffectiveTackles: Int?
    let inGoalEscapes:      Int?
    let interchangedOff:    Int?
    let interchangesOn:     Int?
    let kickErrors:         Int?
    let kickMetres:         Int?
    let kickReturnMetres:   Int?
    let kickReturns:        Int?
    let kicks4020:          Int?
    let kicksDead:          Int?
    let lastTouchTryAssists: Int?
    let lineBreakAssists: Int?
    let lineBreakCauses: Int?
    let lineBreaks: Int?
    let lineEngagements: Int?
    let longKicks: Int?
    let missedTackles: Int?
    let offLoads: Int?
    let onePassRuns : Int?
    let penaltiesConceded: Int?
    let playeTheBalls: Int?
    let runMetres: Int?
    let runs7lessMeters: Int?
    let runs8plusMeters: Int?
    let sendOffs: Int?
    let sinBins: Int?
    let stealsOneOnOne: Int?
    let stolenOneOnOne: Int?
    let tackleBusts: Int?
    let tackledOpp20: Int?
    let tackleOppHalf: Int?
    let tacklesOneOnOne: Int?
    let tryAssists: Int?
    let tryCauses: Int?
    let tryContPercent: Int?
    let tryContributions: Int?
    let tryInvolvements: Int?
    let twentyMetreRestarts: Int?
    let weightedKicks: Int?
}

struct PlayerTest: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case lastMatch     = "last_match_stats"
    }
    
    let lastMatch : PlayerStats
}

