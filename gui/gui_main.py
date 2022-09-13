#!/usr/bin/env python
from tkinter import *
from tkinter import messagebox
from PIL import Image, ImageTk
import config
import util
from console import create_tables_2, create_views, drop_all, populate_tables, query_tables


root = Tk()
root.title('Library Database System - Menu')
root.geometry("400x600")
root.grid_columnconfigure((0, 40), weight=1)
root.grid_rowconfigure((0,40),weight=1)


def drop_tables_button():
    drop_all.drop_all()
    messagebox.showinfo("Library database", "Tables dropped")

def create_tables_button():
    create_tables_2.create_tables()
    messagebox.showinfo("Library database", "Tables created")

def populate_tables_button():
    populate_tables.populate_tables()
    messagebox.showinfo("Library database", "Tables populated")
    
def query_tables_button():
    """
    Creates another window for custom queries
    """
    window = Toplevel(root)
    window.geometry("400x400")
    window.title('Query Window')
    
    query_label = Label(window, text="Enter custom query")
    query_label.grid(row=1, column=0)
    
    custom_query = Entry(window, width =42)
    #custom_query.grid(row=1, column=2, columnspan=2,padx=20)        
    custom_query.grid(row=1, column=2, columnspan=2)
    
    #Entry(window, textvariable=custom_query, justify=LEFT).grid(row=1,column=2, padx=(0,5))
    
    submitButton = Button(window, text="Run query", width=10, command=lambda:custom_query_button(custom_query.get()))
    submitButton.grid(row=2, column=2, pady=10)
    
    window.mainloop()
    
def custom_query_button(myquery):    
        
    cursor = config.connection.cursor()    
    statement=myquery
    data=cursor.execute(statement)
    results=[]
    rows = cursor.fetchall()
    for row in rows:
        results.append(row)        
        print(row)

    Label(root, textvariable=statement, 
         font="Helvetica 12 bold", 
         justify=LEFT).grid(row=5, column=2, sticky=E)
    
    messagebox.showinfo("Library database - Query Results", results)
    
def create_views_button():
    create_views.create_views()
    messagebox.showinfo("Library database", "Views created")

def create_buttons():
    createButton = Button(root, text="Drop Tables/Views", command=drop_tables_button, height = 2, width = 30)
    createButton.grid(row=1, column=1)

    createButton = Button(root, text="Create Tables", command=create_tables_button, height = 2, width = 30)
    createButton.grid(row=2, column=1)

    createButton = Button(root, text="Populate Tables", command=populate_tables_button, height = 2, width = 30)
    createButton.grid(row=3, column=1)
    
    createButton = Button(root, text="Create Views", command=create_views_button, height = 2, width = 30)
    createButton.grid(row=4, column=1)
    
    emptyRowLabel=Label(root, text="")
    emptyRowLabel.grid(row=5, column=1)
    #createButton = Button(root, text="Query Tables", command=query_tables_button, height = 2, width = 30)
    #createButton.grid(row=5, column=1)
    query_label = Label(root, text="Enter custom query")
    query_label.grid(row=6, column=1)
    
    custom_query = Entry(root, width =42)
    #custom_query.grid(row=1, column=2, columnspan=2,padx=20)        
    custom_query.grid(row=7, column=1)
    
    #Entry(window, textvariable=custom_query, justify=LEFT).grid(row=1,column=2, padx=(0,5))
    
    submitButton = Button(root, text="Run query", width=10, command=lambda:custom_query_button(custom_query.get()))
    submitButton.grid(row=8, column=1, pady=10)
    
    

def get_image_file_path(file: str):
    return util.get_root_python_proj_dir()+ '\\Img\\' + file

def append_image(file: str):
    imgfile=get_image_file_path(file)    
    image=Image.open(imgfile)
    image=image.resize((150,150), Image.ANTIALIAS)
    photo=ImageTk.PhotoImage(image)    
    label=Label(image=photo)
    label.image=photo
    label.place(x=120,y=10)
        
def main():

    append_image('library.png')

    menu = Label(root, text = "Library Database System")    
    menu.config(font =("Helvetica", 18))
    menu.grid(row=0, column=1, pady=20)
    menu.place(x=50,y=130)
    
    
    create_buttons()

    root.mainloop()

if __name__ == "__main__":
    main()
