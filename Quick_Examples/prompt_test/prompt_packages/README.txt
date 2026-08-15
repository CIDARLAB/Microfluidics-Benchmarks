Neptune prompt packages for the five evaluation LLMs.

Source of truth: Neptune_2026/Prompt/
This folder is a copy/export for prompt_test web-chat evaluation.

How to use (one chat per LLM):
1. Load that model's pack as system / custom instructions:
   - ChatGPT / Claude / Gemini: upload the .zip, paste en2lfr_system.txt into Instructions.
   - Qwen / DeepSeek: upload or paste the .md.
2. Paste all_11_devices.txt as the user message.
3. Save the 11 ```lfr blocks into prompt_test/<model>/roundN/.
