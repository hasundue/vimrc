import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.6.0/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v3.6.0/base/config.ts";
import { Params as FfParams } from "https://deno.land/x/ddu_ui_ff@v1.1.0/ff.ts";
import { Params as FilerParams } from "https://deno.land/x/ddu_ui_filer@v1.1.0/filer.ts";

export class Config extends BaseConfig {
  config(args: ConfigArguments) {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      uiParams: {
        _: {
          autoAction: {
            name: "preview",
          },
          floatingBorder: "rounded",
          highlights: {
            floating: "Normal",
            floatingBorder: "WinSeparator",
          },
          previewCol: "(&columns - eval(uiParams.winWidth)) / 2",
          previewRow: "&lines / 2 + &lines / 2",
          previewFloating: true,
          previewWidth: "min([&columns, 80])",
          previewHeight: "&lines / 2 - 2",
          previewFloatingBorder: "rounded",
          previewWindowOptions: [
            ["&number", 1],
          ],
          startAutoAction: true,
          split: "floating",
          winHeight: 10,
          winRow: "&lines / 2 - 12",
          winWidth: "min([&columns, 80])",
        } satisfies Partial<FfParams | FilerParams>,
        ff: {
          filterSplitDirection: "floating",
          filterFloatingPosition: "top",
        } satisfies Partial<FfParams>,
        filer: {
          sort: "filename",
          sortTreesFirst: true,
        } satisfies Partial<FilerParams>,
      },
      sourceOptions: {
        _: {
          ignoreCase: true,
          smartCase: true,
        },
        file_external: {
          matchers: ["matcher_zf"],
          sorters: ["sorter_zf"],
          converters: ["converter_zf"],
        },
        rg: {
          volatile: true,
        },
        file: {
          volatile: true,
          columns: ["filename"],
          matchers: ["matcher_hidden"],
        },
        git_status: {
          converters: ["converter_git_status"],
          path: "expand('%:h')",
        },
      },
      sourceParams: {
        file_external: {
          cmd: ["git", "ls-files", "-co", "--exclude-standard"],
        },
        rg: {
          args: ["--json"],
        },
        mr: {
          kind: "mrw",
        },
      },
      kindOptions: {
        _: {
          defaultAction: "open",
        },
      },
    });
  }
}