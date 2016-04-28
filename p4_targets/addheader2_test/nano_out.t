type: PACKET_IN, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, port_in: 1
type: PARSER_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, header_id: 1 (ext[0])
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, header_id: 2 (ext[1])
type: PARSER_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_MISS, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 1 (t_norm)
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 5 (a_norm)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 0 (t_addh), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 0 (a_addh)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 2 (fwd), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 2 (a_fwd)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, pipeline_id: 1 (egress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 5 (check1), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 8 (_no_op)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 3 (t_resize_pr), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 7 (a_resize_pr_03)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 6 (check2), entry_hdl: 3
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 8 (_no_op)
type: TABLE_MISS, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, table_id: 4 (t_prep_deparse)
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, action_id: 3 (a_prep_deparse)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, header_id: 1 (ext[0])
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, header_id: 2 (ext[1])
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, header_id: 3 (ext[2])
type: DEPARSER_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 74, copy_id: 0, port_out: 2
type: PACKET_IN, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, port_in: 1
type: PARSER_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, header_id: 1 (ext[0])
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, header_id: 2 (ext[1])
type: PARSER_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_MISS, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 1 (t_norm)
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 5 (a_norm)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 0 (t_addh), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 0 (a_addh)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 2 (fwd), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 2 (a_fwd)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, pipeline_id: 1 (egress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 5 (check1), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 8 (_no_op)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 3 (t_resize_pr), entry_hdl: 2
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 7 (a_resize_pr_03)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 6 (check2), entry_hdl: 3
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 8 (_no_op)
type: TABLE_MISS, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, table_id: 4 (t_prep_deparse)
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, action_id: 3 (a_prep_deparse)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, header_id: 1 (ext[0])
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, header_id: 2 (ext[1])
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, header_id: 3 (ext[2])
type: DEPARSER_DONE, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id : 0, sig: 9678993803857325402, id: 75, copy_id: 0, port_out: 2
