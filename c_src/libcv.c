#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <erl_nif.h>
#include "cv_monochrome.h"

static ERL_NIF_TERM cv_monochrome_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
    return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] =
{
	{"cv_monochrome_nif", 2, cv_monochrome_nif}
};

ERL_NIF_INIT(Elixir.CvMonochrome, nif_funcs, NULL, NULL, NULL, NULL)
