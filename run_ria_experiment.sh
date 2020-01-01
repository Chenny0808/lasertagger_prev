python phrase_vocabulary_optimization.py --input_file=..\..\dataset\ria\ria.shuffled.train.json --input_format=ria_bpe --vocabulary_size=2045 --max_input_examples=1000000 --output_file=model\label_map.txt

python preprocess_main.py --input_file=..\..\dataset\ria\ria.shuffled.test.json --input_format=ria --output_tfrecord=model/ria_test.tf_record --label_map_file=model/label_map.txt --vocab_file=..\..\model\bert\rubert_cased_L-12_H-768_A-12_v2\vocab.txt --output_arbitrary_targets_for_infeasible_examples=true


python preprocess_main.py --input_file=..\..\dataset\ria\ria.shuffled.train.json --input_format=ria --output_tfrecord=model/ria_train.tf_record --label_map_file=model/label_map.txt --vocab_file=..\..\model\bert\rubert_cased_L-12_H-768_A-12_v2\vocab.txt --output_arbitrary_targets_for_infeasible_examples=false


# python run_lasertagger.py --training_file=model\ria_train.tf_record --eval_file=model\ria_test.tf_record --label_map_file=model\label_map.txt --model_config_file=configs\lasertagger_config.json --output_dir=model\models\ria_first_experiment --do_train=true --do_eval=true --train_batch_size=8 --num_train_examples=153462 --num_eval_examples=49938 --init_checkpoint=..\..\model\bert\rubert_cased_L-12_H-768_A-12_v2\bert_model.ckpt --save_checkpoints_steps=500