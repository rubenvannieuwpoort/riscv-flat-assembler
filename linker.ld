ENTRY(_start)

SECTIONS
{
    . = 0;

    .boot : { *(.boot) }

    .text : { *(.text.startup) *(.text) }

    .rodata : { *(.rodata) }
    
    .data : { *(.srodata) *(.data) }

    .bss : { *(.bss) }

    /DISCARD/ : { * }
}
