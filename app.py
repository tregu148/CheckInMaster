import gradio as gr
import subprocess

def run_command(cmd):
    try:
        result = subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        return result.stdout
    except subprocess.CalledProcessError as e:
        return e.stderr

demo = gr.Interface(fn=run_command, inputs="text", outputs="text")

if __name__ == "__main__":
    demo.launch(show_api=False, server_name="0.0.0.0")
