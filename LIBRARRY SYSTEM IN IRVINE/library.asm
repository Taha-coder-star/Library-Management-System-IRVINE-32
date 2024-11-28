INCLUDE IRVINE32.inc

.DATA

msg1    BYTE 0AH
        BYTE    "--------------------------------------------", 0dh, 0ah
        BYTE    "--  WELCOME TO LIBRARY MANAGEMENT SYSTEM  --", 0dh, 0ah
        BYTE    "--------------------------------------------", 0dh, 0ah
        BYTE    "1-> Register a Member", 0dh, 0ah
        BYTE    "2-> View Members", 0dh, 0ah
        BYTE    "3-> Add Books", 0dh, 0ah
        BYTE    "4-> Search Books", 0dh, 0ah
        BYTE    "5-> View Books", 0dh, 0ah
        BYTE    "6-> Exit program", 0dh, 0ah
        BYTE    "Choose Your Option: ", 0

msg2    BYTE 0AH
        BYTE    "--------------------------------------------", 0dh, 0ah
        BYTE    "--  WELCOME TO OUR LIBRARY  --", 0dh, 0ah
        BYTE    "--------------------------------------------", 0dh, 0ah
        BYTE    "Please enter your name to register: ", 0

book_title_prompt BYTE 0AH, "Please enter the book title: ", 0
book_author_prompt BYTE "Please enter the author's name: ", 0
book_registered_msg BYTE "Book registered successfully: ", 0
books_list_msg      BYTE 0AH, "List of Registered Books:", 0
no_books_msg        BYTE 0AH, "No new books are added.", 0
search_prompt       BYTE 0AH, "Enter the title of the book to search: ", 0
book_found_msg      BYTE "Book found: ", 0
book_author_msg     BYTE "Author: ", 0
book_not_found_msg  BYTE "No book with the given title exists.", 0

member_registered_msg BYTE "Member registered successfully: ", 0
members_list_msg      BYTE 0AH, "List of Registered Members:", 0
no_members_msg        BYTE 0AH, "No members registered yet.", 0
member_limit_msg      BYTE 0AH, "Member limit reached. Cannot register more members.", 0

buffer_mem    BYTE 50 DUP (?)       ; Temporary buffer for member input
book_buffer_mem BYTE 50 DUP (?)     ; Temporary buffer for book input
author_buffer_mem BYTE 50 DUP (?)   ; Temporary buffer for author input
MEMBER_SIZE   EQU 20                ; Fixed size for each member name
BOOK_SIZE     EQU 50                ; Fixed size for each book title
AUTHOR_SIZE   EQU 50                ; Fixed size for each author name

; Static buffers for up to 5 members and books
MEMBER1       BYTE MEMBER_SIZE DUP (?)
MEMBER2       BYTE MEMBER_SIZE DUP (?)
MEMBER3       BYTE MEMBER_SIZE DUP (?)
MEMBER4       BYTE MEMBER_SIZE DUP (?)
MEMBER5       BYTE MEMBER_SIZE DUP (?)
BOOK1         BYTE BOOK_SIZE DUP (?)
BOOK2         BYTE BOOK_SIZE DUP (?)
BOOK3         BYTE BOOK_SIZE DUP (?)
BOOK4         BYTE BOOK_SIZE DUP (?)
BOOK5         BYTE BOOK_SIZE DUP (?)
AUTHOR1       BYTE AUTHOR_SIZE DUP (?)
AUTHOR2       BYTE AUTHOR_SIZE DUP (?)
AUTHOR3       BYTE AUTHOR_SIZE DUP (?)
AUTHOR4       BYTE AUTHOR_SIZE DUP (?)
AUTHOR5       BYTE AUTHOR_SIZE DUP (?)



MEMBERS       DWORD OFFSET MEMBER1, OFFSET MEMBER2, OFFSET MEMBER3, OFFSET MEMBER4, OFFSET MEMBER5
BOOKS         DWORD OFFSET BOOK1, OFFSET BOOK2, OFFSET BOOK3, OFFSET BOOK4, OFFSET BOOK5
AUTHORS       DWORD OFFSET AUTHOR1, OFFSET AUTHOR2, OFFSET AUTHOR3, OFFSET AUTHOR4, OFFSET AUTHOR5

NUM_MEMBERS   DWORD 0              
NUM_BOOKS     DWORD 0              
msg3 BYTE 0AH
     
      BYTE "OUR MOST POPULAR BOOKS", 0dh, 0ah

books1  BYTE "1. 'To Kill a Mockingbird' by Harper Lee", 0dh, 0ah
books2  BYTE "2. '1984' by George Orwell", 0dh, 0ah
books3  BYTE "3. 'The Great Gatsby' by F. Scott Fitzgerald", 0dh, 0ah
books4  BYTE "4. 'Pride and Prejudice' by Jane Austen", 0dh, 0ah
books5  BYTE "5. 'The Catcher in the Rye' by J.D. Salinger", 0dh, 0ah
books6  BYTE "6. 'The Lord of the Rings' by J.R.R. Tolkien", 0dh, 0ah
books7  BYTE "7. 'Harry Potter and the Sorcerer's Stone' by J.K. Rowling", 0dh, 0ah
books8  BYTE "8. 'The Hobbit' by J.R.R. Tolkien", 0dh, 0ah
books9  BYTE "9. 'Fahrenheit 451' by Ray Bradbury", 0dh, 0ah
books10 BYTE "10. 'The Alchemist' by Paulo Coelho", 0dh, 0ah
books11 BYTE "11. 'The Diary of a Young Girl' by Anne Frank", 0dh, 0ah
books12 BYTE "12. 'The Little Prince' by Antoine de Saint-Exup�ry", 0dh, 0ah
books13 BYTE "13. 'Moby-Dick' by Herman Melville", 0dh, 0ah
books14 BYTE "14. 'Jane Eyre' by Charlotte Bront�", 0dh, 0ah
books15 BYTE "15. 'Wuthering Heights' by Emily Bront�", 0dh, 0ah
books16 BYTE "16. 'Animal Farm' by George Orwell", 0dh, 0ah
books17 BYTE "17. 'Brave New World' by Aldous Huxley", 0dh, 0ah
books18 BYTE "18. 'The Adventures of Huckleberry Finn' by Mark Twain", 0dh, 0ah
books19 BYTE "19. 'The Odyssey' by Homer", 0dh, 0ah
books20 BYTE "20. 'Crime and Punishment' by Fyodor Dostoevsky", 0
.CODE

main PROC
    repeat_menu:          

    call Menu             

    call ReadInt          
    cmp eax, 1
    je call_RegisterMember
    cmp eax, 2
    je call_ViewMembers   
    cmp eax, 3
    je call_AddBooks       
    
    cmp eax, 4
    je call_SearchBooks
    cmp eax, 5
    je call_ViewBooks  
    cmp eax, 6
    je call_ExitProgram  

    jmp repeat_menu      

call_RegisterMember:
    call RegisterMember  
    jmp repeat_menu      

call_ViewMembers:
    call ViewMembers     
        jmp repeat_menu        

call_AddBooks:
    call AddBooks          
    jmp repeat_menu        

call_SearchBooks:
    call SearchBooks       
    jmp repeat_menu        

call_ViewBooks:
    call ViewBooks         
    jmp repeat_menu        

call_ExitProgram:
    call ExitProgram       

main ENDP


Menu PROC
    lea edx, msg1         
    call WriteString      
    ret
Menu ENDP



RegisterMember PROC
    call ClrScr             
    lea edx, msg2           
    call WriteString        

    lea edx, buffer_mem     
    mov ecx, 50             
    call ReadString         

    mov eax, [NUM_MEMBERS]  
    cmp eax, 5              
    jae member_limit_reached

    
    mov edi, [MEMBERS + eax * 4]
    lea esi, buffer_mem     
    mov ecx, MEMBER_SIZE   
    cld                     
    rep movsb               

    inc DWORD PTR [NUM_MEMBERS] 

   
    lea edx, member_registered_msg
    call WriteString
    lea edx, buffer_mem     
    call WriteString
    call CrLf

    jmp end_register

    member_limit_reached:
        lea edx, member_limit_msg
        call WriteString
        call CrLf

    end_register:
        ret
RegisterMember ENDP

ViewMembers PROC
    call ClrScr            

    mov eax, [NUM_MEMBERS] 
    cmp eax, 0             
    je no_members          

    ; Display list of members
    lea edx, members_list_msg
    call WriteString       

    mov ebx, OFFSET MEMBERS
    mov ecx, [NUM_MEMBERS] 
    xor esi, esi           

print_members_loop:
    mov edi, [ebx + esi * 4] 
    lea edx, [edi]           
    call WriteString         
    call CrLf                
    inc esi                  
    loop print_members_loop  

    jmp end_proc

no_members:
    lea edx, no_members_msg
    call WriteString        

end_proc:
    call CrLf               
    ret
ViewMembers ENDP




AddBooks PROC
    call ClrScr             
    lea edx, book_title_prompt
    call WriteString        

    lea edx, book_buffer_mem
    mov ecx, 50             
    call ReadString         

    lea edx, book_author_prompt
    call WriteString        

    lea edx, author_buffer_mem
    mov ecx, 50             
    call ReadString         

    mov eax, [NUM_BOOKS]    
    cmp eax, 5              
    jae book_limit_reached

    
    mov edi, [BOOKS + eax * 4]
    lea esi, book_buffer_mem
    mov ecx, BOOK_SIZE      
    cld                     
    rep movsb               

    mov edi, [AUTHORS + eax * 4]
    lea esi, author_buffer_mem
    mov ecx, AUTHOR_SIZE    
    cld                     
    rep movsb               

    inc DWORD PTR [NUM_BOOKS]

    
    lea edx, book_registered_msg
    call WriteString
    lea edx, book_buffer_mem
    call WriteString
    call CrLf

    jmp end_add_book

    book_limit_reached:
   ;     lea edx, book_limit_msg
        call WriteString
        call CrLf

    end_add_book:
        ret
AddBooks ENDP

SearchBooks PROC
    call ClrScr              
    lea edx, search_prompt   
    call WriteString

    lea edx, book_buffer_mem 
    mov ecx, 50              
    call ReadString           

    mov eax, [NUM_BOOKS]     
    cmp eax, 0               
    je no_books              

    mov ebx, OFFSET BOOKS    
    mov ecx, eax             
    xor esi, esi             

search_loop:
    mov edi, [ebx + esi * 4] 
    lea edx, [edi]           
    lea esi, book_buffer_mem 
    call StrCmp              
    test eax, eax            
    je book_found            

    inc esi                  
    loop search_loop         

    jmp no_match            
book_found:
    lea edx, book_found_msg
    call WriteString        
    lea edx, book_buffer_mem 
    call WriteString

   ; lea edx, book_author_msg
  ;  call WriteString       
    ;mov edi, [OFFSET AUTHORS + esi * 4] ; Get the author's name
    ;lea edx, [edi]
    ;call WriteString       
    ;call CrLf
    jmp end_search          

no_match:
    lea edx, book_not_found_msg
    call WriteString        
    call CrLf
    jmp end_search          

no_books:
    lea edx, no_books_msg
    call WriteString         
    call CrLf

end_search:
    ret
SearchBooks ENDP
ViewBooks PROC
    call ClrScr 
    mov edx, offset msg3
    call writestring

    mov eax, [NUM_BOOKS]     
    cmp eax, 0               
    je no_books              

    lea edx, books_list_msg
    call WriteString         

    mov ebx, OFFSET BOOKS    
    mov esi, OFFSET AUTHORS  
    mov ecx, [NUM_BOOKS]     
    xor edi, edi             

view_books_loop:
    mov eax, [ebx + edi * 4] 
    lea edx, [eax]           
    call WriteString         
    call crlf
    lea edx, book_author_msg 
    call WriteString
    mov eax, [esi + edi * 4] 
    lea edx, [eax]
    call WriteString        

    call CrLf                
    inc edi                  
    loop view_books_loop     

    jmp end_view_books       

no_books:
    lea edx, no_books_msg
    call WriteString         

end_view_books:
    call CrLf             
    ret
ViewBooks ENDP


StrCmp PROC
    push esi            
    push edi

compare_loop:
    mov al, [esi]       
    mov bl, [edi]       
    cmp al, bl          
    jne strings_not_equal 
    test al, al         
    je strings_equal    
    inc esi             
    inc edi
    jmp compare_loop    

strings_equal:
    xor eax, eax        
    jmp exit_compare

strings_not_equal:
    mov eax, 1          

exit_compare:
    pop edi             
    pop esi
    ret
StrCmp ENDP



ExitProgram PROC
    call ClrScr             
    lea edx, msg1           
    call WriteString        
    mov eax, 0
    call ExitProcess        
ExitProgram ENDP

END main