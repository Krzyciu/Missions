/*
    Script & config macros prepared for use in mission development

    Source:
      https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp

    Authors:
      CBA Team - Sickboy <sb_at_dev-heaven.net> and Spooner
      Adjusted for mission-making by SzwedzikPL
      Some sweet love by Krzyciu
*/

#define DOUBLES(var1,var2) var1##_##var2
#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define QUOTE(var1) #var1

#define ARR_1(ARG1) ARG1
#define ARR_2(ARG1,ARG2) ARG1, ARG2
#define ARR_3(ARG1,ARG2,ARG3) ARG1, ARG2, ARG3
#define ARR_4(ARG1,ARG2,ARG3,ARG4) ARG1, ARG2, ARG3, ARG4
#define ARR_5(ARG1,ARG2,ARG3,ARG4,ARG5) ARG1, ARG2, ARG3, ARG4, ARG5
#define ARR_6(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6
#define ARR_7(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7
#define ARR_8(ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) ARG1, ARG2, ARG3, ARG4, ARG5, ARG6, ARG7, ARG8

#define FUNC(fncName) TRIPLES(PREFIX,fnc,fncName)
#define LINKFUNC(x) {_this call FUNC(x)}
#define QFUNC(fncName) QUOTE(FUNC(fncName))
#define ACE_PREFIX ace
#define ACEFUNC(module,function) TRIPLES(DOUBLES(ACE_PREFIX,module),fnc,function)
#define A4ES_PREFIX a4es
#define A4ESFUNC(module,function) TRIPLES(DOUBLES(A4ES_PREFIX,module),fnc,function)
#define GVAR(varName) DOUBLES(PREFIX,varName)
#define QGVAR(varName) QUOTE(GVAR(varName))
#define PREP(fncName) FUNC(fncName) = compileScript [ARR_2(QUOTE(functions\DOUBLES(fnc,fncName).sqf),true)]
#define PREPAMB(fncName) FUNC(fncName) = compileScript [ARR_2(QUOTE(functions\ambientCivs\DOUBLES(fnc,fncName).sqf),true)]
#define LSTRING(var1) QUOTE(TRIPLES(STR,PREFIX,var1))
#define LLSTRING(var1) localize LSTRING(var1)
#define CSTRING(var1) QUOTE(TRIPLES($STR,PREFIX,var1))

#define RETDEF(VARIABLE,DEFAULT_VALUE) (if (isNil {VARIABLE}) then [{DEFAULT_VALUE}, {VARIABLE}])
#define RETNIL(VARIABLE) RETDEF(VARIABLE,nil)

#define PFORMAT_1(MESSAGE,A) \
    format ['%1: A=%2', MESSAGE, RETNIL(A)]

#define PFORMAT_2(MESSAGE,A,B) \
    format ['%1: A=%2, B=%3', MESSAGE, RETNIL(A), RETNIL(B)]

#define PFORMAT_3(MESSAGE,A,B,C) \
    format ['%1: A=%2, B=%3, C=%4', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C)]

#define PFORMAT_4(MESSAGE,A,B,C,D) \
    format ['%1: A=%2, B=%3, C=%4, D=%5', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D)]

#define PFORMAT_5(MESSAGE,A,B,C,D,E) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E)]

#define PFORMAT_6(MESSAGE,A,B,C,D,E,F) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F)]

#define PFORMAT_7(MESSAGE,A,B,C,D,E,F,G) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G)]

#define PFORMAT_8(MESSAGE,A,B,C,D,E,F,G,H) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H)]

#define PFORMAT_9(MESSAGE,A,B,C,D,E,F,G,H,I) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9, I=%10', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H), RETNIL(I)]

#define LOG_SYS_FORMAT(LEVEL,MESSAGE) format ['[%1] %2: %3', toUpper 'PREFIX', LEVEL, MESSAGE]
#define LOG_SYS(LEVEL,MESSAGE) if (is3DENPreview) then {LOG_SYS_FORMAT(LEVEL,MESSAGE) call CBA_fnc_log;}
#define LOG_SYS_FILELINENUMBERS(LEVEL,MESSAGE) LOG_SYS(LEVEL,format [ARR_4('%1 %2:%3',MESSAGE,__FILE__,__LINE__ + 1)])

#define TRACE_1(MESSAGE,A) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_1(str diag_frameNo + ' ' + (MESSAGE),A))
#define TRACE_2(MESSAGE,A,B) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_2(str diag_frameNo + ' ' + (MESSAGE),A,B))
#define TRACE_3(MESSAGE,A,B,C) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_3(str diag_frameNo + ' ' + (MESSAGE),A,B,C))
#define TRACE_4(MESSAGE,A,B,C,D) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_4(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D))
#define TRACE_5(MESSAGE,A,B,C,D,E) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_5(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E))
#define TRACE_6(MESSAGE,A,B,C,D,E,F) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_6(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F))
#define TRACE_7(MESSAGE,A,B,C,D,E,F,G) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_7(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G))
#define TRACE_8(MESSAGE,A,B,C,D,E,F,G,H) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_8(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H))
#define TRACE_9(MESSAGE,A,B,C,D,E,F,G,H,I) LOG_SYS_FILELINENUMBERS('TRACE',PFORMAT_9(str diag_frameNo + ' ' + (MESSAGE),A,B,C,D,E,F,G,H,I))

#define LOG(MESSAGE) LOG_SYS_FILELINENUMBERS('LOG',MESSAGE)
#define LOG_1(MESSAGE,ARG1) LOG(FORMAT_1(MESSAGE,ARG1))
#define LOG_2(MESSAGE,ARG1,ARG2) LOG(FORMAT_2(MESSAGE,ARG1,ARG2))
#define LOG_3(MESSAGE,ARG1,ARG2,ARG3) LOG(FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define LOG_4(MESSAGE,ARG1,ARG2,ARG3,ARG4) LOG(FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define LOG_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) LOG(FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define LOG_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) LOG(FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define LOG_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) LOG(FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define LOG_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) LOG(FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))
