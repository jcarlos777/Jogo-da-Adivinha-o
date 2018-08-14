def boas_vindas
  puts "Seja bem vindo!"
  puts "Digite o seu nome: "
  nome = gets.chomp
  puts "Olá, seja bem vindo, #{nome}"
  puts "\n\n"
  nome
end

def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil, (2) Fácil, (3) Normal, (4) Difícil, (5) Impossível"
    puts "Escolha: "
    dificuldade = gets.to_i
end

def tente(dificuldade)
    case dificuldade
    when 1
        maximo = 30
      when 2
         maximo = 60
    when 3
         maximo = 90
    when 4
         maximo = 150
      else
        maximo = 200
end
  puts "Pense em um número entre 0 e #{maximo}..."
  numero_secreto = rand(maximo) + 1
  puts "Ok, se escolheu iremos conferir..."
  numero_secreto
end

def roleta(chutes, tentativa, numero_de_tentativas)
  puts "Tentativa #{tentativa} de #{numero_de_tentativas}"
  puts "Chutes até agora #{chutes}"
  puts "Digite o número secreto: "
  chute = gets
  puts "Você digitou #{chute}"
  chute.to_i
end

def final(numero_secreto, chute)

  acertou = numero_secreto == chute

  if acertou
    ganhou
    return true
  end

  else
    puts "Você errou!"
  false
    end

def ganhou
  puts "Parabéns você ganhou o jogo =)"
  puts "Acertou! xD"
end

def joga(nome, dificuldade)
  numero_secreto = tente dificuldade

  pontos_ate_agora = 1000
  numero_de_tentativas = 5
  chutes = []

  for tentativa in 1.. numero_de_tentativas

  chute = roleta(chutes, tentativa, numero_de_tentativas)
  chutes << chute

  if nome == "Carlos"
      ganhou
      break
  end

  pontos_a_perder = (chute - numero_secreto).abs / 2.0
  pontos_ate_agora -= pontos_a_perder

  if final(numero_secreto, chute)
    break
   end
  end

  puts "Você fez #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.chomp
    nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
  joga nome, dificuldade
  if nao_quer_jogar?
      break
    end
end
