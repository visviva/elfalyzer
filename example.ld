/* Define memory regions */
MEMORY
{
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 256K
}

/* Define size limits for sections */
CUSTOM_DATA1_SIZE = 4;    /* 4 bytes (int) */
CUSTOM_DATA2_SIZE = 8;    /* 4 bytes (int) */
CUSTOM_TEXT1_SIZE = 64;   /* 64 bytes, just an example */
CUSTOM_TEXT2_SIZE = 64;   /* 64 bytes, just an example */

/* Entry point */
ENTRY(main)

SECTIONS
{
    /* Place the .text section (and any custom text sections) in FLASH */
    .text :
    {
        *(.text)
        *(.custom_text1)
        *(.custom_text2)
    } > FLASH

    /* Place the .data section (and any custom data sections) in RAM */
    .data :
    {
        *(.data)
    } > RAM

    .bss : 
    {
        *(.bss)
    }

    .custom_data1 :
    {
        *(.custom_data1)
    } > RAM
    /* ASSERT(SIZEOF(.custom_data1) <= CUSTOM_DATA1_SIZE, ".custom_data1 exceeds size limit!") */

    .custom_data2 :
    {
        *(.custom_data2)
    } > RAM
    /* ASSERT(SIZEOF(.custom_data2) <= CUSTOM_DATA2_SIZE, ".custom_data2 exceeds size limit!") */

    /* Try to ASSERT instead of doing a post-mortem analysis when sections got too big. */
}
