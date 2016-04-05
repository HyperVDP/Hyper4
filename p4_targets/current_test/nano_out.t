type: PACKET_IN, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, port_in: 1
type: PARSER_START, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, header_id: 2 (extracted)
type: PARSER_DONE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, table_id: 0 (t_act), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, action_id: 1 (a_act)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, table_id: 1 (fwd), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, action_id: 3 (a_fwd)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, pipeline_id: 1 (egress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, table_id: 2 (csum16), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, action_id: 2 (a_ipv4_csum16)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, header_id: 2 (extracted)
type: DEPARSER_DONE, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id : 0, sig: 1514833243713196193, id: 580, copy_id: 0, port_out: 2
type: PACKET_IN, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, port_in: 2
type: PARSER_START, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, parser_id: 0 (parser)
type: PARSER_EXTRACT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, header_id: 2 (extracted)
type: PARSER_DONE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, parser_id: 0 (parser)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, pipeline_id: 0 (ingress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, table_id: 0 (t_act), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, action_id: 1 (a_act)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, table_id: 1 (fwd), entry_hdl: 1
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, action_id: 3 (a_fwd)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, pipeline_id: 0 (ingress)
type: PIPELINE_START, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, pipeline_id: 1 (egress)
type: TABLE_HIT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, table_id: 2 (csum16), entry_hdl: 0
type: ACTION_EXECUTE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, action_id: 2 (a_ipv4_csum16)
type: PIPELINE_DONE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, pipeline_id: 1 (egress)
type: DEPARSER_START, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, deparser_id: 0 (deparser)
type: DEPARSER_EMIT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, header_id: 2 (extracted)
type: DEPARSER_DONE, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, deparser_id: 0 (deparser)
type: PACKET_OUT, switch_id: 0, cxt_id : 0, sig: 3274650110512961656, id: 581, copy_id: 0, port_out: 1
