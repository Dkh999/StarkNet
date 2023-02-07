{\rtf1\ansi\ansicpg1251\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
%lang starknet\
\
from starkware.cairo.common.math import assert_nn\
from starkware.cairo.common.cairo_builtins import HashBuiltin\
\
@storage_var\
func balance() -> (res: felt) \{\
\}\
\
@external\
func increase_balance\{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr\}(\
  amount: felt\
) \{\
  with_attr error_message("Amount must be positive. Got: \{amount\}.") \{\
      assert_nn(amount);\
  \}\
\
  let (res) = balance.read();\
  balance.write(res + amount);\
  return ();\
\}\
\
\
@view\
func get_balance\{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr\}() -> (res: \
felt) \{\
  let (res) = balance.read();\
  return (res,);\
\}\
\
\
@constructor\
func constructor\{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr\}() \{\
  balance.write(0);\
  return ();\
\}\
}