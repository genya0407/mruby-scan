/*
** mrb_scan.c - Scan class
**
** Copyright (c) Yusuke Sangenya 2022
**
** See Copyright Notice in LICENSE
*/

#include "mruby.h"
#include "mruby/data.h"
#include "mrb_scan.h"

#define DONE mrb_gc_arena_restore(mrb, 0);

typedef struct {
  char *str;
  mrb_int len;
} mrb_scan_data;

static const struct mrb_data_type mrb_scan_data_type = {
  "mrb_scan_data", mrb_free,
};

static mrb_value mrb_scan_init(mrb_state *mrb, mrb_value self)
{
  mrb_scan_data *data;
  char *str;
  mrb_int len;

  data = (mrb_scan_data *)DATA_PTR(self);
  if (data) {
    mrb_free(mrb, data);
  }
  DATA_TYPE(self) = &mrb_scan_data_type;
  DATA_PTR(self) = NULL;

  mrb_get_args(mrb, "s", &str, &len);
  data = (mrb_scan_data *)mrb_malloc(mrb, sizeof(mrb_scan_data));
  data->str = str;
  data->len = len;
  DATA_PTR(self) = data;

  return self;
}

static mrb_value mrb_scan_hello(mrb_state *mrb, mrb_value self)
{
  mrb_scan_data *data = DATA_PTR(self);

  return mrb_str_new(mrb, data->str, data->len);
}

static mrb_value mrb_scan_hi(mrb_state *mrb, mrb_value self)
{
  return mrb_str_new_cstr(mrb, "hi!!");
}

void mrb_mruby_scan_gem_init(mrb_state *mrb)
{
  struct RClass *scan;
  scan = mrb_define_class(mrb, "Scan", mrb->object_class);
  mrb_define_method(mrb, scan, "initialize", mrb_scan_init, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, scan, "hello", mrb_scan_hello, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, scan, "hi", mrb_scan_hi, MRB_ARGS_NONE());
  DONE;
}

void mrb_mruby_scan_gem_final(mrb_state *mrb)
{
}

