extern int main(void);

void __attribute__((section (".boot"))) _start() {
    main();
}

